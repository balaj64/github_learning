from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Custom_library:
    def __init__(self):
        # Get the SeleniumLibrary instance
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword("Add item to the card")
    def add_item_to_the_card(self, product_list):
        """
        Adds specified items to the cart based on their names.
        :param product_list: List of product names to add to the cart.
        """
        print(f"Received product list: {product_list}")  # Debugging log
        i = 1
        products = self.sellib.get_webelements("xpath://div/h4")
        for prod in products:
            if prod.text in product_list:
                print(f"Adding product to cart: {prod.text}")  # Debugging log
                self.sellib.click_element(f"xpath:(//div[@class='card-footer'])[{i}]/button")
            i += 1
        # Click on the checkout button
        self.sellib.click_link("css:.btn-primary")

    @keyword("Verify the item to be added in card")
    def verify_the_item_to_be_added_in_card(self, checkout_product_list):
        """
        Verifies that the items added to the cart match the expected items.
        :param checkout_product_list: List of expected product names in the cart.
        """
        products_in_cart = self.sellib.get_webelements("xpath://h4[@class='media-heading']")
        product_names_in_cart = [product.text for product in products_in_cart]
        print(f"Products in cart: {product_names_in_cart}")  # Debugging log
        print(f"Expected products: {checkout_product_list}")  # Debugging log
        if set(product_names_in_cart) != set(checkout_product_list):
            raise AssertionError("Products in the cart do not match the expected products.")
        return True
