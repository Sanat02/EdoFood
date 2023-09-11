package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.CartDto;
import kg.attractor.restaurants.model.Cart;
import kg.attractor.restaurants.model.User;
import kg.attractor.restaurants.repository.CartRepository;
import kg.attractor.restaurants.repository.FoodRepository;
import kg.attractor.restaurants.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
        return cartRepository.existsCartByFoodFoodIdAndUserId(foodId, buyerId);
    }

    public void updateQuantityAndPrice(CartDto cartDto) {
        Cart existedCart = cartRepository.findCartByFoodFoodIdAndUserId(cartDto.getFoodId(), cartDto.getUserId());
        int quantity = existedCart.getQuantity() + 1;
        BigDecimal qty = new BigDecimal(quantity);
        BigDecimal foodPrice = existedCart.getFood().getPrice();
        BigDecimal totalPrice = foodPrice.multiply(qty);
        cartRepository.updatePriceAndQuantity(existedCart.getCartId(), totalPrice, quantity);
    }

    public Page<CartDto> getCartsByBuyerId(int buyerId, int start, int end) {
        Pageable pageable = PageRequest.of(start, end);
        Page<Cart> carts = cartRepository.findCartsByUserId(buyerId, pageable);
        Page<CartDto> cartDtos = carts.map(e -> {
            return CartDto.builder()
                    .cartId(e.getCartId())
                    .userId(e.getUser().getId())
                    .foodId(e.getFood().getFoodId())
                    .quantity(e.getQuantity())
                    .total(e.getTotal())
                    .build();
        });
        return cartDtos;
    }

    public void delete(int cartId){
        cartRepository.deleteById(cartId);
    }
    public Boolean existsByUserIdAndCarId(int userId,int cartId){
        return cartRepository.existsCartByCartIdAndUserId(cartId,userId);
    }
}
