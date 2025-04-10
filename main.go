package main

import (
	"assignment23/config"
	"assignment23/models"
	"assignment23/routes"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	// Load Env
	err := godotenv.Load()

	if err != nil {
		panic("Error loading ENV")
	}

	db := config.ConnectDatabase()
	db.AutoMigrate(&models.Produk{})
	db.AutoMigrate(&models.Inventaris{})

	router := gin.Default()
	db.AutoMigrate(&models.Produk{})
	db.AutoMigrate(&models.Inventaris{})
	routes.SetUpRoutes(router, db)
	router.Run(":8080")
}
