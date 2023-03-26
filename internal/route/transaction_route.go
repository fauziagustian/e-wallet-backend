package route

import (
	"wallet-service/internal/handler"
	"wallet-service/internal/middleware"

	"github.com/gin-gonic/gin"
)

func (r *Router) Transaction(route *gin.RouterGroup, h *handler.Handler) {
	route.Use(middleware.AuthMiddleware(r.jwtService, r.userService))
	route.GET("/transactions", h.GetTransactions)
	route.POST("/top-up", h.TopUp)
	route.POST("/transfer", h.Transfer)
	route.POST("/withdraw", h.Withdraw)
}
