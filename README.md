# RailsApp

![Screenshot From 2025-04-15 10-39-54](https://github.com/user-attachments/assets/bce37d5d-1790-4505-91bd-fa8d68549df0)
![Screenshot From 2025-04-15 10-40-30](https://github.com/user-attachments/assets/ed1f5f35-007f-41a2-8dfb-b61d57583f68)

## Overview
RailsApp is a Ruby on Rails application designed as a starter project to kickstart your development process. It includes essential components and configurations to help you build robust and scalable web applications quickly.

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/railsapp.git
    ```
2. Navigate to the project directory:
    ```bash
    cd railsapp
    ```
3. Install dependencies:
    ```bash
    bundle install
    ```
4. Set up the database:
    ```bash
    rails db:setup
    ```

## Usage
Start the Rails server:
```bash
rails server
```
Visit the application at `http://localhost:3000`.

### CRUD Table Component

The application includes a reusable CRUD table component that you can include in any view to display and manage data.

#### Usage

To use the CRUD table component, render it in your view with the following parameters:

```erb
<%= render "shared/components/crud_table",
  thing: "user",
  columns: Userlist.table_columns,
  datas: @userlists,
  pagy: @pagy,
  actions: [
    { name: "Edit", path: "userlist_path", icon: "edit" },
    { name: "Delete", path: "userlist_path", icon: "trash", method: :delete }
  ] %>
```

#### Customizing the Edit Modal Form

The CRUD table component uses an edit modal form to update data. You can customize the form fields by specifying the `type` and `form` options in the `table_columns` method of your model.

*   **`type`**: Determines the type of form input used for the field. Supported types include `"string"`, `"email"`, `"password"`, `"text_area"`, `"select"`, `"date"`, `"datetime"`, and `"check_box"`. If not specified, it defaults to `"string"`.
*   **`form`**: A boolean value that determines whether the field should be included in the edit modal form. If set to `false`, the field will not be displayed in the form. Defaults to `true`.

Example:

```ruby
# app/models/userlist.rb
class Userlist < ApplicationRecord
  def self.table_columns
    [
      { label: "Username", field: "username", bold: true, type: "string" },
      { label: "Email", field: "email", copiable: true, type: "email" },
      { label: "Address", field: "address", bold: true, type: "string" },
      { label: "Created At", field: "created_at", strftime: "%b %d, %Y ", form: false }, # Not editable
      { label: "Updated At", field: "updated_at", strftime: "%b %d, %Y ", form: false }  # Not editable
    ]
  end
end
```

## Testing
Run the test suite to ensure everything is working as expected:
```bash
rails test
```

## Contributing
We welcome contributions to improve RailsApp! Follow these steps to contribute:
1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-name
    ```
3. Commit your changes:
    ```bash
    git commit -m "Add feature"
    ```
4. Push to the branch:
    ```bash
    git push origin feature-name
    ```
5. Open a pull request for review.

## License
This project is licensed under the [MIT License](LICENSE).

## Contact
For questions, suggestions, or feedback, please reach out at [your email or other contact info].
