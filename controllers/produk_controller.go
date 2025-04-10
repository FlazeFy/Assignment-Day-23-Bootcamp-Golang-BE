package controllers

import (
	"assignment23/models"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type ProdukController struct {
	DB *gorm.DB
}

func NewProdukController(db *gorm.DB) *ProdukController {
	return &ProdukController{DB: db}
}

// Queries
func (c *ProdukController) GetAllProduk(ctx *gin.Context) {
	// Models
	var produk []models.Produk

	// Query
	c.DB.Find(&produk)

	// Response
	status := http.StatusNotFound
	var data interface{} = nil

	if len(produk) > 0 {
		status = http.StatusOK
		data = produk
	}

	ctx.JSON(status, gin.H{
		"data":    data,
		"message": "Produk fetched",
	})
}

func (c *ProdukController) GetProdukById(ctx *gin.Context) {
	// Params
	id := ctx.Param("id")

	// Model
	var produk models.Produk

	// Query
	result := c.DB.First(&produk, "id = ? AND deleted_at IS NULL", id)

	// Response
	if result.Error != nil {
		ctx.JSON(http.StatusNotFound, gin.H{
			"data":    nil,
			"message": "produk not found",
		})
		return
	}

	ctx.JSON(http.StatusOK, gin.H{
		"data":    produk,
		"message": "Produk fetched",
	})
}

func (c *ProdukController) GetProdukByKategori(ctx *gin.Context) {
	// Params
	kategori := ctx.Param("kategori")

	// Model
	var produk []models.Produk

	// Query
	result := c.DB.Where("kategori = ? AND deleted_at IS NULL", kategori).Find(&produk)

	// Response
	status := http.StatusNotFound
	var data interface{} = nil

	if result.Error == nil && len(produk) > 0 {
		status = http.StatusOK
		data = produk
	}

	ctx.JSON(status, gin.H{
		"data":    data,
		"message": "Produk by kategori fetched",
	})
}

// Commands
func (c *ProdukController) CreateProduk(ctx *gin.Context) {
	// Models
	var produk models.Produk

	// Validation
	if err := ctx.ShouldBindJSON(&produk); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"message": "invalid request body",
		})
	}

	// Query
	result := c.DB.Create(&produk)

	// Response
	if result.Error != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"message": "failed to create produk",
		})
	}

	ctx.JSON(http.StatusCreated, gin.H{
		"data":    produk,
		"message": "Produk created",
	})
}

func (c *ProdukController) UpdateProdukById(ctx *gin.Context) {
	// Params
	id := ctx.Param("id")

	// Model
	var produk models.Produk
	var req models.Produk

	// Validation
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"message": "invalid request body",
		})
		return
	}

	// Query
	result := c.DB.First(&produk, "id = ? AND deleted_at IS NULL", id)
	if result.Error != nil {
		ctx.JSON(http.StatusNotFound, gin.H{
			"message": "produk not found",
		})
		return
	}

	produk.Name = req.Name
	produk.Deskripsi = req.Deskripsi
	produk.Harga = req.Harga
	produk.Kategori = req.Kategori

	c.DB.Save(&produk)

	// Response
	ctx.JSON(http.StatusOK, gin.H{
		"data":    produk,
		"message": "Produk updated",
	})
}

func (c *ProdukController) SoftDeleteProdukById(ctx *gin.Context) {
	// Params
	id := ctx.Param("id")

	// Model
	var produk models.Produk

	// Query
	result := c.DB.First(&produk, "id = ? AND deleted_at IS NULL", id)
	if result.Error != nil {
		ctx.JSON(http.StatusNotFound, gin.H{
			"message": "produk not found",
		})
		return
	}
	c.DB.Delete(&produk)

	// Response
	ctx.JSON(http.StatusOK, gin.H{
		"message": "Produk deleted",
	})
}

func (c *ProdukController) HardDeleteProdukById(ctx *gin.Context) {
	// Params
	id := ctx.Param("id")

	// Model
	var produk models.Produk

	// Query
	result := c.DB.Unscoped().First(&produk, "id = ? AND deleted_at IS NOT NULL", id)
	if result.Error != nil {
		ctx.JSON(http.StatusNotFound, gin.H{
			"message": "produk not found",
		})
		return
	}
	c.DB.Unscoped().Delete(&produk)

	// Response
	ctx.JSON(http.StatusOK, gin.H{
		"message": "Produk permanentally deleted",
	})
}
