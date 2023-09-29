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
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Thông tin cá nhân'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Cài đặt'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<ProfileBloc>().add(LogoutUser());
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Đăng xuất'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
