import '../entities/focus_session_entity.dart';

abstract class FocusRepository {
  Future<FocusSessionEntity> saveSession(FocusSessionEntity session);
  Future<FocusSessionEntity?> getActiveSession(String userId);
  Future<List<FocusSessionEntity>> getCompletedSessions(String userId);
  Future<void> deleteSession(String sessionId);
}
