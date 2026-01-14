*** Variables ***
${URL}                     https://www.saucedemo.com
${BROWSER}                 chrome
${USERNAME}                standard_user
${PASSWORD}                secret_sauce

# --- Selectors ---
${LOGIN_USER}              id:user-name
${LOGIN_PASSWORD}          id:password
${LOGIN_BUTTON}            id:login-button

${BURGER_MENU_BTN}         id:react-burger-menu-btn
${BURGER_MENU_CLOSE_BTN}   id:react-burger-cross-btn

${MENU_ALL_ITEMS}          id:inventory_sidebar_link
${MENU_ABOUT}              id:about_sidebar_link
${MENU_LOGOUT}             id:logout_sidebar_link
${MENU_RESET_APP_STATE}    id:reset_sidebar_link

${PRODUCTS_PAGE_TEXT}      Products
${LOGOUT_PAGE_BUTTON}      id:login-button
${SHOPPING_CART_BADGE}     class:shopping_cart_link
