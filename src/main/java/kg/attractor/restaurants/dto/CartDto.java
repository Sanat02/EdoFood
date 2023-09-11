package kg.attractor.restaurants.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class CartDto {
    private int cartId;
    private int userId;
    private int foodId;
    private int quantity;
    private BigDecimal total;
}
