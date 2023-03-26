package route

import (
	"wallet-service/internal/handler"
	"wallet-service/internal/middleware"

	"github.com/gin-gonic/gin"
)

func (r *Router) Auth(route *gin.RouterGroup, h *handler.Handler) {
	route.POST("/register", h.Register)
	route.POST("/login", h.Login)
	route.POST("/logout", middleware.AuthMiddleware(r.jwtService, r.userService), h.Logout)
}
