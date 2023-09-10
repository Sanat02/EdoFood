package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.FoodDto;
import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.service.FoodService;
import kg.attractor.restaurants.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/foods")
public class FoodsController {
    private final FoodService foodService;
    private final RestaurantService restaurantService;
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
            model.addAttribute("username", auth.getName());
        }
        Page<FoodDto> foods = foodService.getFoodsByRestaurantId(restaurantId, page, PAGE_SIZE);
        model.addAttribute("foods", foods);
        model.addAttribute("restaurant", restaurantService.getRestaurantById(restaurantId));
        return "foods";
    }
}
