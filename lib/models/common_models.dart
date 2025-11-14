class RestaurantResponseOptions{
  bool availabilityRules;
  bool restaurantLogo;
  bool restaurantBanners;
  bool cuisineTypes;

  RestaurantResponseOptions({
    this.availabilityRules = false,
    this.restaurantLogo = true,
    this.restaurantBanners = false,
    this.cuisineTypes = false,
  });
}