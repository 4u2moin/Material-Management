# Material Management CRUD API

A Spring Boot-based REST API for managing materials, including CRUD operations with proper validation, soft delete, and audit tracking.

---

## Table of Contents

- [Overview](#overview)
- [Technology Stack](#technology-stack)
- [Database Schema](#database-schema)
- [Features](#features)
- [API Endpoints](#api-endpoints)
- [Setup Instructions](#setup-instructions)
- [Testing](#testing)
- [Design Decisions](#design-decisions)
- [Optional Features](#optional-features)

---

## Overview

This project implements a Material Management module using **Spring Boot** with a **layered architecture** (Controller → Service → Repository).  
The API supports managing materials along with their associated:

- Unit of Measurement (UOM)
- Material Type
- Manufacturer
- Vendor

It uses **UUID primary keys**, **soft delete**, and audit fields for created/updated tracking.

---

## Technology Stack

- Java 17 / 18 / 21
- Spring Boot 3.x
- Spring Data JPA
- PostgreSQL
- Maven
- Swagger/OpenAPI
- JUnit 5 & Mockito (for unit tests)

---

## Database Schema

### `material` Table

| Field                     | Type      | Description |
|----------------------------|-----------|-------------|
| material_id               | UUID      | Primary key |
| external_id               | String    | Auto-generated external ID |
| material_name             | String    | Unique name (active records only) |
| material_rate_per_pack    | Decimal   | Rate per pack |
| material_pack_size        | Decimal   | Pack size |
| material_desc             | String    | Optional description |
| uom_id                    | UUID      | Foreign key to `unit_of_measurement` |
| material_type_id          | UUID      | Foreign key to `material_type` |
| material_manufacturer_id  | UUID      | Foreign key to `material_manufacturer` |
| material_vendor_id        | UUID      | Foreign key to `material_vendor` |
| is_active                 | Boolean   | Soft delete flag |
| created_by                | UUID      | User who created the record |
| created_on                | Timestamp | Record creation time |
| updated_by                | UUID      | User who updated the record |
| updated_on                | Timestamp | Record update time |

Other reference tables: `unit_of_measurement`, `material_type`, `material_manufacturer`, `material_vendor`.

---

## Features

- Full CRUD operations for Material entity
- Soft delete using `is_active` flag
- Audit fields (`created_by`, `created_on`, `updated_by`, `updated_on`)
- DTO-based request and response objects
- Input validation using `@Valid` and `jakarta.validation`
- Foreign key existence checks before insert/update
- Exception handling with meaningful messages
- Paginated and filtered retrieval (GET all with optional filters)

---

## API Endpoints

| Method | URL | Description | Request Body | Response Body |
|--------|-----|------------|--------------|---------------|
| GET | `/api/materials` | Get all active materials with optional filters | None | Array of `MaterialResponseDTO` |
| GET | `/api/materials/{id}` | Get material by UUID | None | `MaterialResponseDTO` |
| POST | `/api/materials` | Create a new material | `MaterialRequestDTO` | `MaterialResponseDTO` (Created) |
| PUT | `/api/materials/{id}` | Update an existing material | `MaterialRequestDTO` | `MaterialResponseDTO` (Updated) |
| DELETE | `/api/materials/{id}` | Soft delete a material | None | `{ "message": "Material deleted successfully", "materialId": "uuid" }` |
| GET | `/api/materials/search?keyword={keyword}&page=0&size=10` | Search materials by keyword | None | Array of `MaterialResponseDTO` |

# Design Decisions

## 1. Layered Architecture
**Controller → Service → Repository**

**Reason:** Separates responsibilities:
- **Controller:** Handles HTTP requests/responses and validation.
- **Service:** Contains business logic and transaction handling.
- **Repository:** Interacts with the database using JPA or MongoDB template.

**Benefit:** Improves maintainability, testability, and readability.

---

## 2. DTO Pattern
**Used DTOs:** `MaterialRequestDTO` and `MaterialResponseDTO`

**Reason:**
- Decouples API model from database entity.
- Allows flexibility to change internal entity structure without affecting the API.
- Helps in validation and shaping responses according to API needs.

**Benefit:** Enhances security, reduces over-fetching, and provides clean API contracts.

---

## 3. UUID as Primary Key
**Reason:**
- Ensures globally unique identifiers.
- Useful for distributed systems where numeric IDs may collide.

**Benefit:** Improves scalability and integration with external services.

---

## 4. Soft Delete
**Implemented in:** `DELETE /api/materials/{id}`

**Reason:** Preserves historical data for audit purposes.  
**Implementation:** Material has an `isActive` flag instead of physically deleting from DB.

**Benefit:** Data integrity and auditability.

---

## 5. Validation
**Implemented using:** `@Valid` and Jakarta Validation annotations

**Reason:** Prevents invalid data from entering the system.

**Benefit:** Reduces runtime errors and ensures consistent data quality.

---

## 6. Pagination and Filtering
**GET `/api/materials` supports:** `page`, `size`, `materialName`, `typeName`, `manufacturerName`, `vendorName`.

**Reason:** Handles large datasets efficiently.

**Benefit:** Reduces memory usage and improves API performance.

---

## 7. Search Functionality
**GET `/api/materials/search?keyword=`**

**Reason:** Provides keyword-based search across materials.  
**Implementation:** Service layer handles filtering using JPA query methods or repository custom queries.

**Benefit:** User-friendly material lookup and better UX.

---

## 8. Testing Strategy
**Frameworks:** JUnit 5, Mockito

**Reason:** Ensures API correctness and regression-free code changes.  
**Tests include:**
- CRUD operations
- Search functionality
- Soft delete behavior

**Benefit:** High confidence in code quality and maintainability.

---

## 9. HTTP Status Codes
- **POST → 201 Created**
- **GET → 200 OK**
- **PUT → 200 OK**
- **DELETE → 200 OK**

**Reason:** Follows RESTful best practices.

**Benefit:** Provides standard and predictable responses for clients.
