import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    @keyword
    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_card(self, productList):
        i = 1
        product_title = self.sellib.get_webelements("css:.card-title")
        for product in product_title:
            if product.text in productList:
                self.sellib.click_button("xpath:(//div[@class='card-footer'])["+str(i)+"]/button")
            i += 1
            time.sleep(10)
