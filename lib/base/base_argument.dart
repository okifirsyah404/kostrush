/// Base class for all arguments
abstract class BaseArguments {
  dynamic mainArgument;
}

/// Base class for all controller-view with no arguments
abstract class NoArguments extends BaseArguments {
  NoArguments() {
    mainArgument = null;
  }
}
