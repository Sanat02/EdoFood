package kg.attractor.restaurants.service;

import kg.attractor.restaurants.dto.RoleDto;
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

    public int save(UserDto userDto) {
        return userRepository.save(User.builder()
                .id(userDto.getId())
                .password(encoder.encode(userDto.getPassword()))
                .accountName(userDto.getAccountName())
                .role(Role.builder()
                        .id(userDto.getRole().getId())
                        .name(userDto.getRole().getName())
                        .build())
                .email(userDto.getEmail())
                .build()).getId();

    }

    public UserDto getUserByEmail(String email) {
        User user = userRepository.findUserByEmail(email).orElse(null);
        if (user == null) {
            return null;
        } else {
            UserDto userDto = UserDto.builder()
                    .id(user.getId())
                    .accountName(user.getAccountName())
                    .email(user.getEmail())
                    .role(RoleDto.builder()
                            .id(user.getRole().getId())
                            .name(user.getRole().getName())
                            .build())
                    .build();
            return userDto;
        }
    }
}
