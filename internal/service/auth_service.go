package service

import (
	"net/mail"

	"wallet-service/internal/dto"
	"wallet-service/internal/model"
	r "wallet-service/internal/repository"
	"wallet-service/pkg/custom_error"

	"golang.org/x/crypto/bcrypt"
)

type AuthService interface {
	Attempt(input *dto.LoginRequestBody) (*model.User, error)
}

type authService struct {
	userRepository r.UserRepository
}

type ASConfig struct {
	UserRepository r.UserRepository
}

func NewAuthService(c *ASConfig) AuthService {
	return &authService{
		userRepository: c.UserRepository,
	}
}

func (s *authService) Attempt(input *dto.LoginRequestBody) (*model.User, error) {
	_, err := mail.ParseAddress(input.Email)
	if err != nil {
		return &model.User{}, &custom_error.NotValidEmailError{}
	}

	user, err := s.userRepository.FindByEmail(input.Email)
	if err != nil {
		return user, err
	}

	if user.ID == 0 {
		return user, &custom_error.UserNotFoundError{}
	}

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(input.Password))
	if err != nil {
		return user, &custom_error.IncorrectCredentialsError{}
	}

	return user, nil
}
