import { Injectable } from '@nestjs/common';
import { CreateAuthDto, LoginDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { PrismaClient, user } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {

  constructor(
    private prisma: PrismaClient,
    private jwtService: JwtService,
  ) { }

  async create(createAuthDto: CreateAuthDto) {
    try {
      const createUser = await this.prisma.user.create({
        data: {
          name: createAuthDto.name,
          email: createAuthDto.email,
          password: createAuthDto.password,
          phone: createAuthDto.phone,
          birthday: createAuthDto.birthday,
          gender: createAuthDto.gender,
          role: createAuthDto.role 
        }
      });
      return createUser;
    } catch (error) {
      throw new Error('Failed to create user');
    }
  }

  async login(loginDto: LoginDto): Promise<string> {
    const { email, password } = loginDto;

    const user: user | null = await this.prisma.user.findFirst({
      where: { email },
    });

    if (!user || user.password !== password) {
      throw new Error('Invalid credentials');
    }

    const token = this.jwtService.sign({ userId: user.id }, { expiresIn: "5m", secret: "SECRET_KEY" });

    return token;
  }
}
