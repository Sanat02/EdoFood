package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.CartDto;
import kg.attractor.restaurants.model.Cart;
import kg.attractor.restaurants.model.User;
import kg.attractor.restaurants.repository.CartRepository;
import kg.attractor.restaurants.repository.FoodRepository;
import kg.attractor.restaurants.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartRepository cartRepository;
    private final UserRepository userRepository;
    private final FoodRepository foodRepository;

    public void save(CartDto cartDto, int quantity) {
        BigDecimal bigDecimalValue = new BigDecimal(quantity);
        cartRepository.save(Cart.builder()
                .user(userRepository.findById(cartDto.getUserId()).orElse(null))
                .food(foodRepository.findById(cartDto.getFoodId()).orElse(null))
                .quantity(quantity)
                .total(foodRepository.findById(cartDto.getFoodId()).orElse(null).getPrice().multiply(bigDecimalValue))
                .build());
    }

    public boolean isExists(int buyerId, int foodId) {
        return cartRepository.existsCartByFoodFoodIdAndUserId( foodId,buyerId);
    }
    public void updateQuantityAndPrice(CartDto cartDto){
        Cart existedCart=cartRepository.findCartByFoodFoodIdAndUserId(cartDto.getFoodId(),cartDto.getUserId());
        int quantity=existedCart.getQuantity()+1;
        BigDecimal qty=new BigDecimal(quantity);
        BigDecimal foodPrice=existedCart.getFood().getPrice();
        BigDecimal totalPrice=foodPrice.multiply(qty);
        cartRepository.updatePriceAndQuantity(existedCart.getCartId(),totalPrice,quantity);
    }
}
