package kg.attractor.restaurants.repository;

import jakarta.transaction.Transactional;
import kg.attractor.restaurants.model.Cart;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;

public interface CartRepository extends JpaRepository<Cart,Integer> {
    Boolean existsCartByFoodFoodIdAndUserId(int foodId,int buyerId);
    Boolean existsCartByCartIdAndUserId(int cartId,int userId);

    Cart findCartByFoodFoodIdAndUserId(int foodId,int buyerId);

    @Modifying
    @Transactional
    @Query("UPDATE Cart c SET c.total= :price, c.quantity = :quantity WHERE c.cartId = :cartItemId")
    void updatePriceAndQuantity(@Param("cartItemId") int cartItemId, @Param("price") BigDecimal price, @Param("quantity") int quantity);

    Page<Cart> findCartsByUserId(int userId, Pageable pageable);
}
