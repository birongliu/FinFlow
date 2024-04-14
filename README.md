# FinFlow

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#product-spec)

## Overview

### Description
An app that enable users to see how their finance every month flow by providing their receipt.

### App Evaluation   
 - **Category:** LifeStyle
 - **Mobile:** allows users to input their receipts in real-time, right after they make a purchase. This not only ensures that the data is up-to-date but also makes the process more convenient for the users.
 - **Story:** The FinFlow App is designed to give users a clear and detailed view of their monthly finances. By simply providing their receipts, users can see how their money flows in and out. This app would be valuable to anyone wanting to gain better control over their finances. Friends and peers who struggle with budgeting or want to save more effectively would likely find this app useful.
 - **Market:** many people looking for easy and intuitive ways to manage their money. The potential user base includes anyone who earns and spends money, from young adults just starting to manage their own finances to older adults looking to save for retirement. This app could provide significant value to people who struggle with traditional budgeting methods or who simply want a more visual representation of their finances.
 - **Habit:** The FinFlow App is designed to be used regularly. Users would be encouraged to input their receipts as they receive them, leading to frequent use. The app is not just for consumption; users also create content by inputting their financial data and setting budgeting goals.
 - **Scope:** The first version of the app would introduce the basic functionality of inputting receipts and visualizing financial flow. Later versions could introduce more advanced features, such as budgeting tools, savings goals, and integration with bank accounts for real-time financial tracking.
 
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
- User can login
- User can view individual receipts in a nice format
- User can view the spending diagram
- User can upload receipts mannually

**Optional Nice-to-have Stories**
- User can filter by categories. ie: restaurants, travel 
- User can connect with others ie: friends, family to view each other spending habbits. (and allow to split the bill)
- User can change theme
- User can add profile picture
- User can logout

### 2. Screen Archetypes
**Login Screen**
 - User can Login with third party Oauth2

**Stream**
 - User can view the spending diagram

**Creation**
 - User can upload receipts mannually or camera

**Search** 
 - User can filter by categories. ie: restaurants, travel 

 **Detail**
  - User can view individual receipts in a nice format

### 3. Naviagation
**Tab Navigation (Tab to Screen)**
- Home Feed: Provides a visual representation of the receipts.
- Search Receipts: Allows users to search for specific receipts. This feature can also include information about who is involved in a receipt for bill splitting purposes.
- Profile: Displays user's profile information and settings.

**Flow Navigation (Screen to Screen)**

- **Login Screen**
  - => Home Page

- **Stream Screen**
  - => Navigate to individual receipts

- **Creation Screen**
  - => Home 

- **Search Screen**
  - => None