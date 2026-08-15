import 'dart:async';
import 'package:multicast_dns/multicast_dns.dart';

class ServerDiscovery {
  static const String serviceType = '_gestionm._tcp.local';

  static Future<String?> findServer({
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final client = MDnsClient();

    try {
      await client.start();

      final completer = Completer<String?>();

      final subscription = client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer(serviceType),
      ).listen((ptr) async {
        await for (final srv in client.lookup<SrvResourceRecord>(
          ResourceRecordQuery.service(ptr.domainName),
        )) {
          await for (final ip in client.lookup<IPAddressResourceRecord>(
            ResourceRecordQuery.addressIPv4(srv.target),
          )) {
            if (!completer.isCompleted) {
              completer.complete(
                'http://${ip.address.address}:${srv.port}/api/v1',
              );
            }
          }
        }
      });

      final result = await completer.future.timeout(
        timeout,
        onTimeout: () => null,
      );

      await subscription.cancel();

      return result;
    } catch (e) {
      return null;
    } finally {
      client.stop();
    }
  }
}