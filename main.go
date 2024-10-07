package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Start work on my blog")

	router := gin.Default()
	router.Static("/static", "./web/static")
	router.LoadHTMLGlob("./web/templates/*")

	router.GET("/", func(ctx *gin.Context) {
		ctx.HTML(http.StatusOK, "index.html", nil)
	})

	router.Run("0.0.0.0:8686")
}
