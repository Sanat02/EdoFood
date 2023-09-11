package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.CartDto;
import kg.attractor.restaurants.dto.FoodDto;
import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.model.User;
import kg.attractor.restaurants.service.CartService;
import kg.attractor.restaurants.service.FoodService;
import kg.attractor.restaurants.service.RestaurantService;
import kg.attractor.restaurants.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {
    private final UserService userService;
    private final FoodService foodService;
    private final RestaurantService restaurantService;
    private final CartService cartService;
    private static final int PAGE_SIZE = 5;

    @GetMapping
    public String getProfile(
            @RequestParam(name = "page", defaultValue = "0") int page,
            Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDto userDto = userService.getUserByEmail(auth.getName());
        if (userDto.getRole().getId() == 1) {
            model.addAttribute("company", userDto);
            RestaurantDto restaurant = restaurantService.getRestaurantByUserId(userDto.getId());
            if (restaurant==null){
                return "no restaurant";
            }
            Page<FoodDto> foods = foodService.getFoodsByRestaurantId(restaurant.getId(), page, PAGE_SIZE);
            model.addAttribute("foods", foods);
            model.addAttribute("restaurant", restaurant);
        } else {
            Page<CartDto> carts=cartService.getCartsByBuyerId(userDto.getId(),page,PAGE_SIZE);
            model.addAttribute("carts",carts);
            model.addAttribute("buyer", userDto);
        }
        return "profile";
    }
}
