package kg.attractor.restaurants.controllerRest;

import kg.attractor.restaurants.dto.CartDto;
import kg.attractor.restaurants.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartRestController {
    private final CartService cartService;

    @PostMapping("/add")
    public HttpStatus addToCart(@RequestBody CartDto cartDto) {
        if (cartService.isExists(cartDto.getUserId(), cartDto.getFoodId())) {
            cartService.updateQuantityAndPrice(cartDto);

        } else {
            cartService.save(cartDto, 1);
        }
        return HttpStatus.OK;
    }


}
