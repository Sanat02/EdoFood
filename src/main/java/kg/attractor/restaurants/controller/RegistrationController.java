package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.RoleDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.service.RestaurantService;
import kg.attractor.restaurants.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/register")
public class RegistrationController {
    private final UserService userService;
    private final RestaurantService restaurantService;


    @GetMapping
    public String register() {
        return "registration";
    }


    @PostMapping()
    @ResponseStatus(HttpStatus.SEE_OTHER)
    public String register(
            @RequestParam(name = "account_name") String accountName,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "password") String password,
            @RequestParam(name = "account_type") String accountValue,
            @RequestParam(name = "restaurant_name") String restaurantName,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "address") String address,
            @RequestParam(name = "phone_number") String phone_number

    ) {
        UserDto userDto = UserDto.builder()
                .password(password)
                .accountName(accountName)
                .email(email)
                .build();

        if (accountValue.equals("0")) {
            userDto.setRole(RoleDto.builder()
                    .id(1)
                    .name("Buyer")
                    .build());
            userService.save(userDto);
        } else {
            userDto.setRole(RoleDto.builder()
                    .id(2)
                    .name("Company")
                    .build());
            int userId=userService.save(userDto);
            userDto.setId(userId);
            RestaurantDto restaurantDto = RestaurantDto.builder()
                    .address(address)
                    .phoneNumber(phone_number)
                    .description(description)
                    .name(restaurantName)
                    .user(userDto)
                    .build();
            restaurantService.save(restaurantDto);

        }


        return "redirect:/login";

    }


}
