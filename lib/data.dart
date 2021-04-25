import 'package:flutter/material.dart';

import './models/category.dart';
import './models/product.dart';

const CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Race suits',
    color: Color.fromRGBO(149, 154, 251, 1),
  ),
  Category(
    id: 'c2',
    title: 'Training suits',
    color: Color.fromRGBO(255, 174, 201, 1),
  ),
  Category(
    id: 'c3',
    title: 'Openwater suits',
    color: Color.fromRGBO(149, 154, 251, 1),
  ),
  Category(
    id: 'c4',
    title: 'Swim goggles',
    color: Color.fromRGBO(255, 174, 201, 1),
  ),
  Category(
    id: 'c5',
    title: 'Swim caps',
    color: Color.fromRGBO(149, 154, 251, 1),
  ),
  Category(
    id: 'c6',
    title: 'Footwear',
    color: Color.fromRGBO(255, 174, 201, 1),
  ),
  Category(
    id: 'c7',
    title: 'Training tools',
    color: Color.fromRGBO(149, 154, 251, 1),
  ),
  Category(
    id: 'c8',
    title: 'Bags',
    color: Color.fromRGBO(255, 174, 201, 1),
  ),
  Category(
    id: 'c9',
    title: 'Sportswears',
    color: Color.fromRGBO(149, 154, 251, 1),
  ),
  Category(
    id: 'c10',
    title: 'Accessories',
    color: Color.fromRGBO(255, 174, 201, 1),
  ),
];

const PRODUCTS = const [
  Product(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'Powerskin Carbon Glide Open Back',
    // affordability: Affordability.Affordable,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003901100_001_xl.jpg',
    shipping: 5,
    price: 574,
    materials: [
      '65% Polyamide',
      '34% Elastane',
      '1% Carbon Fiber',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Powerskin Carbon Core Fx',
    // affordability: Affordability.Affordable,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003911100_001_xl.jpg',
    shipping: 6,
    price: 319,
    // materials1: [
    //   '1 Slice White Bread',
    //   '1 Slice Ham',
    //   '1 Slice Pineapple',
    //   '1-2 Slices of Cheese',
    //   'Butter'
    // ],
    materials: [
      '52% Polyamide',
      '47% Elastane',
      '1% Carbon Fiber'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Product(
    id: 'm3',
    categories: [
      'c2',
    ],
    title: 'Night Lights Lightech',
    // affordability: Affordability.Pricey,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos002829510_001_xl.jpg',
    shipping: 5,
    price: 55,
    // materials1: [
    //   '300g Cattle Hack',
    //   '1 Tomato',
    //   '1 Cucumber',
    //   '1 Onion',
    //   'Ketchup',
    //   '2 Burger Buns'
    // ],
    materials: [
      '100% Polyester',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Product(
    id: 'm4',
    categories: [
      'c2',
    ],
    title: 'Team Painted Stripes',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Challenging,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003604503_001_xl.jpg',
    shipping: 5,
    price: 35,
    // materials1: [
    //   '8 Veal Cutlets',
    //   '4 Eggs',
    //   '200g Bread Crumbs',
    //   '100g Flour',
    //   '300ml Butter',
    //   '100g Vegetable Oil',
    //   'Salt',
    //   'Lemon Slices'
    // ],
    materials: [
      '100% Polyester',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Product(
    id: 'm5',
    categories: [
      'c3'
    ],
    title: 'Powerskin Carbon Wave OW Full Body Open Back',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos004023730_001_xl.jpg',
    shipping: 8,
    price: 365,
    // materials1: [
    //   'Arugula',
    //   'Lamb\'s Lettuce',
    //   'Parsley',
    //   'Fennel',
    //   '200g Smoked Salmon',
    //   'Mustard',
    //   'Balsamic Vinegar',
    //   'Olive Oil',
    //   'Salt and Pepper'
    // ],
    materials: [
      '65% Polyamide',
      '35% Elastane',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm6',
    categories: [
      'c3'
    ],
    title: 'Powerskin R-Evo+ Open Water Closed Back',
    // affordability: Affordability.Affordable,
    // complexity: Complexity.Hard,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos2791250_001_xl.jpg',
    shipping: 5,
    price: 330,
    // materials1: [
    //   '4 Sheets of Gelatine',
    //   '150ml Orange Juice',
    //   '80g Sugar',
    //   '300g Yoghurt',
    //   '200g Cream',
    //   'Orange Peel',
    // ],
    materials: [
      '65% Polyamide',
      '35% Elastane',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Product(
    id: 'm7',
    categories: [
      'c4',
    ],
    title: 'The One',
    // affordability: Affordability.Affordable,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos002756100_001_xl.jpg',
    shipping: 5,
    price: 60,
    // materials1: [
    //   '1 1/2 Cups all-purpose Flour',
    //   '3 1/2 Teaspoons Baking Powder',
    //   '1 Teaspoon Salt',
    //   '1 Tablespoon White Sugar',
    //   '1 1/4 cups Milk',
    //   '1 Egg',
    //   '3 Tablespoons Butter, melted',
    // ],
    materials: [
      '50% Polycarbonate',
      '30% Thermoplastic Rubber',
      '20% Silicone',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Product(
    id: 'm8',
    categories: [
      'c4',
    ],
    title: 'Cobra Tri Mirror Triathlon',
    // affordability: Affordability.Pricey,
    // complexity: Complexity.Challenging,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos000022555_001_xl.jpg',
    shipping: 5,
    price: 55,
    // materials1: [
    //   '4 Chicken Breasts',
    //   '1 Onion',
    //   '2 Cloves of Garlic',
    //   '1 Piece of Ginger',
    //   '4 Tablespoons Almonds',
    //   '1 Teaspoon Cayenne Pepper',
    //   '500ml Coconut Milk',
    // ],
    materials: [
      '45% Polycarbonate',
      '30% Silicone',
      '15% Thermoplastic Elastomer',
      '5% Polyoxymethylene',
      '5% Polypropylene',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Product(
    id: 'm9',
    categories: [
      'c5',
    ],
    title: 'Bishamon',
    // affordability: Affordability.Affordable,
    // complexity: Complexity.Hard,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003881103_001_xl.jpg',
    shipping: 8,
    price: 11,
    // materials1: [
    //   '1 Teaspoon melted Butter',
    //   '2 Tablespoons white Sugar',
    //   '2 Ounces 70% dark Chocolate, broken into pieces',
    //   '1 Tablespoon Butter',
    //   '1 Tablespoon all-purpose Flour',
    //   '4 1/3 tablespoons cold Milk',
    //   '1 Pinch Salt',
    //   '1 Pinch Cayenne Pepper',
    //   '1 Large Egg Yolk',
    //   '2 Large Egg Whites',
    //   '1 Pinch Cream of Tartar',
    //   '1 Tablespoon white Sugar',
    // ],
    materials: [
      '100% Silicone',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Product(
    id: 'm10',
    categories: [
      'c5',
    ],
    title: 'Mizu',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
        'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003894500_001_xl.jpg',
    shipping: 5,
    price: 12,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '100% Silicone',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm11',
    categories: [
      'c6',
    ],
    title: 'Marco V. Sandals',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos000030555_001_xl.jpg',
    shipping: 5,
    price: 38,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '60% Ethylene Vinyl Acetate',
      '40% Polyvinyl Chloride'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm12',
    categories: [
      'c7',
    ],
    title: 'Powerfin Pro',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos1e20755_001_xl.jpg',
    shipping: 5,
    price: 53,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '100% Silicone',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm13',
    categories: [
      'c7',
    ],
    title: 'Swim Snorkle III',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos004825905_001_xl.jpg',
    shipping: 5,
    price: 35,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '43% Silicone',
      '40% Polyvinyl Chloride',
      '10% Polyoxymethylene',
      '5% Polycarbonate',
      '2% Acrylonitrile Butadiene Styrene',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm14',
    categories: [
      'c8',
    ],
    title: 'Team Duffle 25',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos002483703_001_xl.jpg',
    shipping: 6,
    price: 30,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '100% Polyester',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm15',
    categories: [
      'c9',
    ],
    title: 'Relax IV Team Jacket Nations',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos003173740_001_xl.jpg',
    shipping: 6,
    price: 150,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '100% Polyester',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Product(
    id: 'm16',
    categories: [
      'c10',
    ],
    title: 'Printed Reusable Face Mask',
    // affordability: Affordability.Luxurious,
    // complexity: Complexity.Simple,
    imageUrl:
    'https://www.arenasport.com/media/catalog/product/cache/260852e6baeaefa2b29d3c90545319ca/f/t/ftp_m_magentoproduct_photos004890124_001_xl.jpg',
    shipping: 6,
    price: 10,
    // materials1: [
    //   'White and Green Asparagus',
    //   '30g Pine Nuts',
    //   '300g Cherry Tomatoes',
    //   'Salad',
    //   'Salt, Pepper and Olive Oil'
    // ],
    materials: [
      '100% Polyester',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
