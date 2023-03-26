package service

import (
	"errors"
	"testing"

	"wallet-service/internal/dto"
	"wallet-service/internal/mocks"
	"wallet-service/internal/model"

	"github.com/stretchr/testify/assert"
)

func TestNewAuthService(t *testing.T) {
	var authService = NewAuthService(&ASConfig{UserRepository: mocks.NewUserRepository(t)})

	assert.NotNil(t, authService)
}

func Test_authService_Attempt(t *testing.T) {
	userRepository := mocks.NewUserRepository(t)
	authService := NewAuthService(&ASConfig{UserRepository: userRepository})

	t.Run("test success attempt user", func(t *testing.T) {
		userRepository.Mock.On("FindByEmail", "fauzi@user.com").Return(&model.User{ID: 1, Name: "fauzi", Email: "fauzi@user.com", Password: "$2a$04$BCOdU/jL1iyPYnnQXis.2Os.HXsjD7/Mxon4kwwPmbnWGFCl83fia"}, nil).Once()

		input := &dto.LoginRequestBody{}
		input.Email = "fauzi@user.com"
		input.Password = "fauzi123"
		user, err := authService.Attempt(input)

		assert.Nil(t, err)
		assert.Equal(t, uint(1), user.ID)
		assert.Equal(t, "fauzi", user.Name)
		assert.Equal(t, "fauzi@user.com", user.Email)
	})

	t.Run("test error attempt user", func(t *testing.T) {
		userRepository.Mock.On("FindByEmail", "fauzi@user.com").Return(&model.User{ID: 1, Name: "fauzi", Email: "fauzi@user.com", Password: "$2a$04$bGSUiGlIy1ysFJntMkCLoO0NiTb9rjeN9/Pedlpe0lFT3dr.RW5EO"}, nil).Once()

		input := &dto.LoginRequestBody{}
		input.Email = "fauzi@user.com"
		input.Password = "fauzi123"
		_, err := authService.Attempt(input)

		assert.NotNil(t, err)
	})

	t.Run("test error attempt email user", func(t *testing.T) {
		userRepository.Mock.On("FindByEmail", "fauzi@user.com").Return(&model.User{ID: 1, Name: "fauzi", Email: "fauzi123@user.com", Password: "$2a$04$bGSUiGlIy1ysFJntMkCLoO0NiTb9rjeN9/Pedlpe0lFT3dr.RW5EO"}, errors.New("something went wrong")).Once()

		input := &dto.LoginRequestBody{}
		input.Email = "fauzi@user.com"
		input.Password = "fauzi123"
		_, err := authService.Attempt(input)

		assert.NotNil(t, err)
	})

	t.Run("test error attempt id = 0 user", func(t *testing.T) {
		userRepository.Mock.On("FindByEmail", "fauzi@user.com").Return(&model.User{}, nil).Once()

		input := &dto.LoginRequestBody{}
		input.Email = "fauzi@user.com"
		input.Password = "fauzi123"
		_, err := authService.Attempt(input)

		assert.NotNil(t, err)
	})

	t.Run("test error not email format", func(t *testing.T) {

		input := &dto.LoginRequestBody{}
		input.Email = "fauziuser.com"
		input.Password = "fauzi123"
		_, err := authService.Attempt(input)

		assert.NotNil(t, err)
	})

}
