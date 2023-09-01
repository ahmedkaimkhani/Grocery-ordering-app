import 'package:flutter/material.dart';

List<Map<String, dynamic>> data = [
  // Index 0
  {
    // Chip 1
    'category': 'Meats & Fishes',
    'shops': [
      // Shop 1 of Meants $ Fishes
      {
        'shopname': 'Big & Small Fishes',
        'subtitle': 'Fresh from sea',
        'price': '\$36/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {
            'productname': 'Clown Tang.H03',
            'price': '\$325',
            'image': 'imageURL'
          },
          {
            'productname': 'Clownfish.H03',
            'price': '\$89',
            'image': 'imageURL'
          },
        ]
      },
      // Shop 2 of Meants $ Fishes
      {
        'shopname': 'Halal Meats',
        'subtitle': 'Purity Meets Flavor',
        'price': '\$90/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Beef Steak', 'price': '\$325', 'image': 'imageURL'},
          {'productname': 'Quail Meat', 'price': '\$150', 'image': 'imageURL'},
        ]
      },
      // Shop 3 of Meants $ Fishes
      {
        'shopname': 'Seafood Sensations',
        'subtitle': 'Dive into Freshness',
        'price': '\$200/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {
            'productname': 'Salmon Fillet',
            'price': '\$325',
            'image': 'imageURL'
          },
          {'productname': 'Swordfish', 'price': '\$89', 'image': 'imageURL'},
        ]
      }
    ]
  },
  // Index 1
  {
    // Chip 2
    'category': 'Vegetables',
    'shops': [
      // Shop 1 of Vegetables
      {
        'shopname': 'Garden of Eatables',
        'subtitle': 'Fresh Greens, Every Day',
        'price': '\$36/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Tomatoes', 'price': '\$20', 'image': 'imageURL'},
          {'productname': 'Cabbage', 'price': '\$45', 'image': 'imageURL'},
        ]
      },
      // Shop 2 of Vegetables
      {
        'shopname': 'Fresh Harvest Market',
        'subtitle': 'Greens Galore',
        'price': '\$90/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Potatoes', 'price': '\$15', 'image': 'imageURL'},
          {'productname': 'Carrots', 'price': '\$32', 'image': 'imageURL'},
        ]
      },
      // Shop 3 of Vegetables
      {
        'shopname': 'The Veggie Patch',
        'subtitle': 'Your Veggie Wonderland',
        'price': '\$36/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Onions', 'price': '\$325', 'image': 'imageURL'},
          {'productname': 'Mushrooms', 'price': '\$89', 'image': 'imageURL'},
        ]
      }
    ]
  },
  // Index 2
  {
    // Chip 3
    'category': 'Fruits',
    'shops': [
      // Shop 1 of Fruits
      {
        'shopname': 'Juicy Delights Fruit',
        'subtitle': 'Fresh and Flavorful Fruits',
        'price': '\$31/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Apples', 'price': '\$48', 'image': 'imageURL'},
          {'productname': 'Bananas', 'price': '\$31', 'image': 'imageURL'},
        ]
      },
      // Shop 2 of Fruits
      {
        'shopname': 'Pomegranate Palace',
        'subtitle': 'Savor the Juicy Goodness',
        'price': '\$35/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Oranges', 'price': '\$35', 'image': 'imageURL'},
          {'productname': 'Grapes', 'price': '\$43', 'image': 'imageURL'},
        ]
      },
      // Shop 3 of Fruits
      {
        'shopname': 'Exotic Fruit Oasis',
        'subtitle': 'Nature\'s Sweetest Treasures',
        'price': '\$61/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Strawberries', 'price': '\$61', 'image': 'imageURL'},
          {'productname': 'Mangoes', 'price': '\$90', 'image': 'imageURL'},
        ]
      }
    ]
  },
  // Index 3
  {
    // Chip 4
    'category': 'Tea Leaves',
    'shops': [
      // Shop 1 of Tea Leaves
      {
        'shopname': 'TeaTreat Provisions',
        'subtitle': 'A Journey in Every Cup',
        'price': '\$69/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Tapal Tea', 'price': '\$90', 'image': 'imageURL'},
          {'productname': 'Lipton', 'price': '\$69', 'image': 'imageURL'},
        ]
      },
      // Shop 2 of Tea Leaves
      {
        'shopname': 'Tea Leaf Treasures',
        'subtitle': 'Crafting Tea Excellence',
        'price': '\$39/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Vital Tea', 'price': '\$51', 'image': 'imageURL'},
          {'productname': 'Supreme Tea', 'price': '\$39', 'image': 'imageURL'},
        ]
      },
      // Shop 3 of Tea Leaves
      {
        'shopname': 'The Flavorful Pantry',
        'subtitle': 'Unwind with a Cup of Serenity',
        'price': '\$43/KG',
        'image': 'imageURL',
        // Shops Products
        'product': [
          {'productname': 'Ahmed Tea', 'price': '\$94', 'image': 'imageURL'},
          {'productname': 'Laiba Tea', 'price': '\$43', 'image': 'imageURL'},
        ]
      }
    ]
  },
];
