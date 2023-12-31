package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class RestaurantsController {
    private final RestaurantService restaurantService;
    private static final int PAGE_SIZE = 10;

    @GetMapping()
    public String getAllRestaurants(
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "searchTerm", defaultValue = "null") String searchTerm,
            Model model
    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        System.out.println(auth.getName());
        if (auth.getName().equals("anonymousUser")) {
            model.addAttribute("username", null);
        } else {
            model.addAttribute("username", auth.getName());
        }
        if (searchTerm.equals("null")) {
            Page<RestaurantDto> restaurants = restaurantService.getAllRestaurants(page, PAGE_SIZE);
            model.addAttribute("restaurants", restaurants);
        } else {
            RestaurantDto restaurant = restaurantService.getRestaurantByName(searchTerm);
            if (restaurant == null) {
                Page<RestaurantDto> restaurants = restaurantService.getAllRestaurants(page, PAGE_SIZE);
                model.addAttribute("restaurants", restaurants);
            } else {
                model.addAttribute("restaurant", restaurant);
            }
        }


        return "restaurants";
    }

    @PostMapping
    @ResponseStatus(HttpStatus.SEE_OTHER)
    public String findJob(
            @RequestParam(name = "searchTerm") String searchTerm
    ) {
        return "redirect:/?page=0&searchTerm=" + searchTerm;
    }
}
