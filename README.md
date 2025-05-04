# Cleanse

Cleanse influences you to create modules and include them dynamically in your classes in order to keep them clean.

## Usage
Create modules with the same name as the class you want to clean up and, finally, include our module with the `include Cleanse::Cleaner` directive in the class.

In the case of Rails applications, all the modules defined in `app/models/concerns` will be included automatically in their respective models. For this to work properly, make sure you enable eager load in each environment in the `config/environments` folder:

```config.eager_load = true```

## Purpose

Imagine a fat product model with countless lines of code. In order to reduce it to just the class definition line (`class Product; end`), we encourage you to create descriptive modules with the same name as your class. `Cleanse::Cleaner` will include all these modules and your code will be more concise, objective and maintainable.

- `app/models/product.rb` -> The cleaned class;
- `app/models/concerns/product/associations.rb` -> The code containing the product model associations;
- `app/models/concerns/product/callbacks.rb` -> The active record callbacks for the product model;
- `app/models/concerns/product/?.rb` -> Whatever you want, it will be included automatically.

## Questions/suggestions/contributions
Feel free to create issues or pull request in this repository.