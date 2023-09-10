package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.RoleDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.model.Restaurant;
import kg.attractor.restaurants.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RestaurantService {
    private final RestaurantRepository restaurantRepository;

    public Page<RestaurantDto> getAllRestaurants(int start, int end) {
        Pageable pageable = PageRequest.of(start, end);
        Page<Restaurant> restaurants = restaurantRepository.findAll(pageable);

        Page<RestaurantDto> restaurantDtos = restaurants.map(e -> {
            return RestaurantDto.builder()
                    .id(e.getRestaurantId())
                    .name(e.getName())
                    .description(e.getDescription())
                    .address(e.getAddress())
                    .phoneNumber(e.getPhoneNumber())
                    .user(UserDto.builder()
                            .id(e.getUser().getId())
                            .accountName(e.getUser().getAccountName())
                            .email(e.getUser().getEmail())
                            .role(RoleDto.builder()
                                    .id(e.getUser().getRole().getId())
                                    .name(e.getUser().getRole().getName())
                                    .build())
                            .build())
                    .build();
        });

        return restaurantDtos;
    }

    public RestaurantDto getRestaurantByName(String name) {

        Restaurant restaurant = restaurantRepository.findByNameIgnoreCase(name).orElse(null);
        if (restaurant == null) {
            return null;
        }
        RestaurantDto restaurantDto = RestaurantDto.builder()
                .id(restaurant.getRestaurantId())
                .name(restaurant.getName())
                .build();
        return restaurantDto;
    }
    public RestaurantDto getRestaurantById(int id){
        Restaurant restaurant=restaurantRepository.findById(id).orElse(null);
        return RestaurantDto.builder()
                .id(restaurant.getRestaurantId())
                .address(restaurant.getAddress())
                .name(restaurant.getName())
                .phoneNumber(restaurant.getPhoneNumber())
                .description(restaurant.getDescription())
                .user(UserDto.builder()
                        .id(restaurant.getUser().getId())
                        .accountName(restaurant.getUser().getAccountName())
                        .build())
                .build();
    }
}
