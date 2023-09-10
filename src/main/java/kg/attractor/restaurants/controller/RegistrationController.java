package kg.attractor.restaurants.controller;

import kg.attractor.restaurants.dto.RoleDto;
import kg.attractor.restaurants.dto.UserDto;
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


    @GetMapping
    public String register() {
        return "registration";
    }


    @PostMapping()
    @ResponseStatus(HttpStatus.SEE_OTHER)
    public String addResume(
            @RequestParam(name = "account_name") String accountName,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "password") String password,
            @RequestParam(name = "account_type") String accountValue

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
        } else {
            userDto.setRole(RoleDto.builder()
                    .id(2)
                    .name("Company")
                    .build());
        }


        userService.save(userDto);
        return "redirect:/login";

    }


}
