package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.UserDto;
import kg.attractor.restaurants.model.Role;
import kg.attractor.restaurants.model.User;
import kg.attractor.restaurants.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder encoder;

    public void save(UserDto userDto) {
        userRepository.save(User.builder()
                .id(userDto.getId())
                .password(encoder.encode(userDto.getPassword()))
                .accountName(userDto.getAccountName())
                .role(Role.builder()
                        .id(userDto.getRole().getId())
                        .name(userDto.getRole().getName())
                        .build())
                .email(userDto.getEmail())
                .build());
    }
}
