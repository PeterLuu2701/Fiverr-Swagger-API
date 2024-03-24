import { ApiProperty } from '@nestjs/swagger';

export class CreateAuthDto {
    @ApiProperty()
    name: string

    @ApiProperty()
    email: string

    @ApiProperty()
    password: string

    @ApiProperty()
    phone: string

    @ApiProperty()
    birthday: Date

    @ApiProperty()
    gender: string

    @ApiProperty({ default: 'member' })
    role: string = 'member';
}

export class LoginDto {
    @ApiProperty()
    email: string;

    @ApiProperty()
    password: string;
}
