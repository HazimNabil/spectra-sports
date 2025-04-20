class ApiConstants {
  ApiConstants._();

  static const baseUrl = 'https://gp-t1br.onrender.com/api';
  static const aiBaseUrl = 'http://127.0.0.1:5000';
  static const login = '/auth/login';
  static const register = '/auth/register/admin';
  static const getTeams = '/admin/teams';
  static const getMatches = '/coach/matches';
  static const addMatch = '/match';
  static const getTeam = '/admin/teams';
  static const updateMatch = '/match';
  static const addPlayer = '/players';

  static const authorization = 'Authorization';
  static const bearer = 'Bearer';
  static const messageKey = 'message';
  static const tokenKey = 'token';
  static const teamsKey = 'teams';
  static const matchesKey = 'matches';

  static const notFoundMessage = 'Your request not found, Please try later.';
  static const serverErrorMessage = 'Internal Server error, Please try later.';
  static const defaultErrorMessage =
      'Oops There was an Error, Please try again.';
  static const connectionTimeoutMessage =
      'Connection timed out. Please check your internet connection and try again.';
  static const receiveTimeoutMessage =
      'Server is taking too long to respond. Please try again later.';
  static const badCertificateMessage =
      'Secure connection verification failed. Please contact support.';
  static const cancelledMessage = 'Request was cancelled. Please try again.';
  static const connectionErrorMessage =
      'Unable to connect to the server. Please check your internet connection.';
  static const unknownMessage = 'Something went wrong. Please try again later.';
  static const sendTimeoutMessage =
      'Failed to send request. Please check your connection.';

}
