abstract  class SubmissionStatus {
  const SubmissionStatus();
}

class SubmissionInitial extends SubmissionStatus {
  const SubmissionInitial();
}

class SubmissionInProgress extends SubmissionStatus {
  const SubmissionInProgress();
}

class SubmissionSuccess extends SubmissionStatus {
  const SubmissionSuccess();
}

class SubmissionFailure extends SubmissionStatus {
  final Exception exception;

  const SubmissionFailure(this.exception);
}