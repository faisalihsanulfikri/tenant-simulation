# TENANT SIMULATION

## AUTHOR
### Faisal Ihsanul Fikri

### School List
- Endpoint: **GET http://localhost:8000/api/school**
- Status: ✅ 

**Success Response**
```json
{
  "code": "200",
  "status": "SUCCESS",
  "message": "success",
  "data": [
    {
      "id": "A",
      "school_name": "SMPN 1 Bandung",
      "db_name": "akm_smpn_1_bandung",
      "db_username": "root",
      "db_password": null,
      "created_at": "2021-03-07 09:07:10",
      "updated_at": "2021-03-07 09:07:10"
    }
  ]
}
```
### Teacher List
- Endpoint: **GET http://localhost:8000/api/teacher/{schoolId}**
- Status: ✅ 

**Success Response**
```json
{
  "code": "200",
  "status": "SUCCESS",
  "message": "success",
  "data": [
    {
        "id": 1,
        "name": "Angga Setiyadi, M.Kom",
        "created_at": "2021-03-07 09:08:39",
        "updated_at": "2021-03-07 09:08:39"
    },
  ]
}
```