package models

import (
	"gorm.io/gorm"
)

type Produk struct {
	gorm.Model
	Name      string `json:"name" gorm:"type:varchar(100);not null"`
	Deskripsi string `json:"deskripsi" gorm:"type:text;null"`
	Harga     int    `json:"harga" gorm:"not null"`
	Kategori  string `json:"kategori" gorm:"type:varchar(50);not null"`
}
