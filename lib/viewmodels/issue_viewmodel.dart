import 'package:cdgi/services/issue_service.dart';
import 'package:fpdart/fpdart.dart';

import '../models/failure_model.dart';
import '../models/issue_model.dart';

class IssueViewModel {
  final _issueService = IssueService();
  Future<Either<Failure, IssueModel>> createIssue(
    String email,
    String name,
    String content,
    String? photo,
    double? lat,
    double? long,
  ) async {
    try {
      IssueModel issue = await _issueService.createIssue(
        email,
        name,
        content,
        photo,
        lat,
        long,
      );
      return Right(issue);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
