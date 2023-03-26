package handler

import (
	"net/http"

	"wallet-service/internal/dto"
	"wallet-service/internal/model"
	"wallet-service/pkg/utils"

	"github.com/gin-gonic/gin"
)

func (h *Handler) Balance(c *gin.Context) {
	user := c.MustGet("user").(*model.User)

	input := &dto.WalletRequestBody{}
	input.UserID = int(user.ID)
	wallet, err := h.walletService.GetWalletByUserId(input)
	if err != nil {
		response := utils.ErrorResponse("show balance failed", http.StatusInternalServerError, err.Error())
		c.JSON(http.StatusInternalServerError, response)
		return
	}

	formattedUser := dto.FormatUserDetail(user, wallet)
	response := utils.SuccessResponse("show balance success", http.StatusOK, formattedUser)
	c.JSON(http.StatusOK, response)
}
