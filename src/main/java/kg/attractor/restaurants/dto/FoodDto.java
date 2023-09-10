package kg.attractor.restaurants.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class FoodDto {
    private int id;
    private RestaurantDto restaurantDto;
    private String name;
    private String description;
    private BigDecimal price;
    private String image;
}
