package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.FoodDto;
import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.service.FoodService;
import kg.attractor.restaurants.service.RestaurantService;
import kg.attractor.restaurants.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@Controller
@RequiredArgsConstructor
@RequestMapping("/foods")
public class FoodsController {
    private final FoodService foodService;
    private final RestaurantService restaurantService;
    private final UserService userService;
    private static final int PAGE_SIZE = 5;

    @GetMapping("/{restaurantId}")
    public String getAllJobResumes(
            @RequestParam(name = "page", defaultValue = "0") int page,
            @PathVariable int restaurantId,
            Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getName());
        if (auth.getName().equals("anonymousUser")) {
            model.addAttribute("username", null);
        } else {
            UserDto userDto = userService.getUserByEmail(auth.getName());
            if (userDto.getRole().getId() == 2) {
                model.addAttribute("buyer", userDto);
            }
            model.addAttribute("username", auth.getName());
        }
        Page<FoodDto> foods = foodService.getFoodsByRestaurantId(restaurantId, page, PAGE_SIZE);
        model.addAttribute("foods", foods);
        model.addAttribute("restaurant", restaurantService.getRestaurantById(restaurantId));
        return "foods";
    }

    @GetMapping("/add")
    public String getAddForm() {
        return "addFood";
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.SEE_OTHER)
    public String addFood(
            @RequestParam(name = "food_name") String food_name,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "price") BigDecimal price

    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDto userDto = userService.getUserByEmail(auth.getName());
        RestaurantDto restaurant = restaurantService.getRestaurantByUserId(userDto.getId());
        FoodDto food = FoodDto.builder()
                .restaurantDto(restaurant)
                .name(food_name)
                .description(description)
                .price(price)
                .build();
        foodService.save(food);
        return "redirect:/profile";
    }

    @GetMapping("/delete/{foodId}")
    public String delete(@PathVariable int foodId) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDto userDto = userService.getUserByEmail(auth.getName());
        RestaurantDto restaurant = restaurantService.getRestaurantByUserId(userDto.getId());
        if (foodService.isExists(foodId, restaurant.getId())) {
            foodService.delete(foodId);
            return "redirect:/profile";
        } else {
            return "prohibited";
        }
    }

}
