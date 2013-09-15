hackish-nameserver Cookbook
===========================
Sets up a pretty static DNS server config.

This is for my personal use so it's pretty hackish.  I recommend using something else.

Requirements
------------
No additional requirements.

Usage
-----
#### base_smartmachine::default
Just include `base_smartmachine` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[base_smartmachine]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Alain O'Dea
