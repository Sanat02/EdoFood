package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class RestaurantsController {
    private final RestaurantService restaurantService;
    private static final int PAGE_SIZE = 10;

    @GetMapping()
    public String getAllJobResumes(
            @RequestParam(name = "page", defaultValue = "0") int page,
            Model model
    ) {
        Page<RestaurantDto> restaurants = restaurantService.getAllRestaurants(page, PAGE_SIZE);
        model.addAttribute("restaurants", restaurants);
        return "restaurants";
    }
}
