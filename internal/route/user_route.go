package route

import (
	"wallet-service/internal/handler"
	"wallet-service/internal/middleware"

	"github.com/gin-gonic/gin"
)

func (r *Router) User(route *gin.RouterGroup, h *handler.Handler) {
	route.GET("/balance", middleware.AuthMiddleware(r.jwtService, r.userService), h.Balance)
}
