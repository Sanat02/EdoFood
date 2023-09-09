package kg.attractor.restaurants.dto;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RestaurantDto {
    private int id;
    private String name;
    private String description;
    private String address;
    private String phoneNumber;
    private UserDto user;
}
