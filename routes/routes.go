package routes

import (
	"assignment23/controllers"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func SetUpRoutes(r *gin.Engine, db *gorm.DB) {
	produkController := controllers.NewProdukController(db)

	api := r.Group("/api")
	{
		produk := api.Group("/produk")
		{
			produk.GET("/", produkController.GetAllProduk)
			produk.GET("/:id", produkController.GetProdukById)
			produk.GET("/kategori/:kategori", produkController.GetProdukByKategori)
			produk.POST("/", produkController.CreateProduk)
			produk.PUT("/:id", produkController.UpdateProdukById)
			produk.DELETE("/delete/:id", produkController.SoftDeleteProdukById)
			produk.DELETE("/destroy/:id", produkController.HardDeleteProdukById)
		}
	}
}
