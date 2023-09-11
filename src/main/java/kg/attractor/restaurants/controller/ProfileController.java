package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.CartDto;
import kg.attractor.restaurants.dto.FoodDto;
import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.service.CartService;
import kg.attractor.restaurants.service.FoodService;
import kg.attractor.restaurants.service.RestaurantService;
import kg.attractor.restaurants.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
@Slf4j
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
        Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
        authorities.forEach(authority -> log.info("Authority: " + authority.getAuthority()));
        UserDto userDto = userService.getUserByEmail(auth.getName());
        if (userDto.getRole().getId() == 1) {
            model.addAttribute("company", userDto);
            RestaurantDto restaurant = restaurantService.getRestaurantByUserId(userDto.getId());
            if (restaurant == null) {
                return "no restaurant";
            }
            Page<FoodDto> foods = foodService.getFoodsByRestaurantId(restaurant.getId(), page, PAGE_SIZE);
            model.addAttribute("foods", foods);
            model.addAttribute("restaurant", restaurant);
        } else {
            Page<CartDto> carts = cartService.getCartsByBuyerId(userDto.getId(), page, PAGE_SIZE);
            model.addAttribute("carts", carts);
            model.addAttribute("buyer", userDto);

        }
        return "profile";
    }

    @PostMapping("/updateQty/{cartId}")
    @ResponseStatus(HttpStatus.SEE_OTHER)
    public String updateQty(
            @RequestParam(name = "quantity") int quantity,
            @PathVariable int cartId

    ) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDto userDto = userService.getUserByEmail(auth.getName());
        if (cartService.existsByUserIdAndCarId(userDto.getId(), cartId)) {
            cartService.updateCartQty(cartId, quantity);
            return "redirect:/profile";
        } else {
            return "prohibited";
        }
    }
}
