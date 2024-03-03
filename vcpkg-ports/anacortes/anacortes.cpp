#include "anacortes/anacortes.h"

#include <fmt/format.h>

namespace anacortes {
std::string hello_username(const std::string& user) {
  return fmt::format("Welcome to the coastal city of Anacortes, {}! ", user);
}
}  // namespace anacortes