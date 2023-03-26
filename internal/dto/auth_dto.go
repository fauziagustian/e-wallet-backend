package dto

import "wallet-service/internal/model"

type LoginRequestBody struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=5"`
}

type RegisterRequestBody struct {
	Name     string `json:"name" binding:"required,alphanum"`
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=5"`
}

type LoginResponseBody struct {
	ID           uint   `json:"id"`
	Name         string `json:"name"`
	Email        string `json:"email"`
	WalletNumber string `json:"wallet"`
	Token        string `json:"token"`
}

type LogoutResponseBody struct {
	Description string `json:"description"`
}

func FormatLogin(user *model.User, wallet *model.Wallet, token string) LoginResponseBody {
	return LoginResponseBody{
		ID:           user.ID,
		Name:         user.Name,
		Email:        user.Email,
		WalletNumber: wallet.Number,
		Token:        token,
	}
}
