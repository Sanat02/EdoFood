package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.FoodDto;
import kg.attractor.restaurants.dto.RestaurantDto;
import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.model.Food;
import kg.attractor.restaurants.model.Restaurant;
import kg.attractor.restaurants.repository.FoodRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class FoodService {
    private final FoodRepository foodRepository;

    public Page<FoodDto> getFoodsByRestaurantId(int restaurantId, int start, int end) {
        Pageable pageable = PageRequest.of(start, end);
        Page<Food> foods = foodRepository.findFoodsByRestaurantRestaurantId(restaurantId, pageable);
        System.out.println(foods.getTotalPages());
        Page<FoodDto> foodDtos = foods.map(e -> {
            return FoodDto.builder()
                    .id(e.getFoodId())
                    .restaurantDto(RestaurantDto.builder()
                            .id(e.getRestaurant().getRestaurantId())
                            .user(UserDto.builder()
                                    .id(e.getRestaurant().getUser().getId())
                                    .accountName(e.getRestaurant().getUser().getAccountName())
                                    .email(e.getRestaurant().getUser().getEmail())
                                    .build())
                            .phoneNumber(e.getRestaurant().getPhoneNumber())
                            .description(e.getRestaurant().getDescription())
                            .address(e.getRestaurant().getAddress())
                            .build())
                    .image(e.getImage())
                    .name(e.getName())
                    .price(e.getPrice())
                    .description(e.getDescription())
                    .build();
        });
        return foodDtos;
    }

    public void save(FoodDto foodDto) {
        foodRepository.save(Food.builder()
                .restaurant(Restaurant.builder()
                        .restaurantId(foodDto.getRestaurantDto().getId())
                        .build())
                .name(foodDto.getName())
                .description(foodDto.getDescription())
                .price(foodDto.getPrice())
                .build());
    }

    public void delete(int foodId) {
        foodRepository.deleteById(foodId);
    }

    public boolean isExists(int foodId, int restaurantId) {
        return foodRepository.existsFoodByFoodIdAndRestaurantRestaurantId(foodId, restaurantId);
    }

}
