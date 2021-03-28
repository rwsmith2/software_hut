# State of the header

Use the variable `@current_nav_identifier` to control the state of the header

e.g.

```ruby
@current_nav_identifier = :admin_home
```

All available symbols are as follows 

| Symbol             | Page                                   |
| ------------------ | -------------------------------------- |
| :admin_home        | Admin home page                        |
| :admin_tasks       | Admin tasks management page            |
| :admin_assessment  | Admin assessment page (create/upload)  |
| :admin_venders     | Admin vender accounts management page  |
| :admin_settings    | Admin settings page (change password)  |
| :vender_home       | Vender home page                       |
| :vender_tasks      | Vender complete task page              |
| :vender_assessment | Vender assessment page (fill out)      |
| :vender_settings   | Vender settings page (change password) |
| :login             | Login page                             |
| :home              | Demo page (reserved)                   |

## TODO

 - [ ] Page urls has not yet been set.
 - [ ] Logout button is not enabled yet. (cancancan related)
