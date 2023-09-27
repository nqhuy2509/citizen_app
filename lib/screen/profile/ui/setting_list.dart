import 'package:citizen_app/screen/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<ProfileBloc>(),
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Thông tin cá nhân'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Cài đặt'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<ProfileBloc>().add(LogoutUser());
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Đăng xuất'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
