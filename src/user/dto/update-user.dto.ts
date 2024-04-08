import { ApiProperty, PartialType } from '@nestjs/swagger';

export class UpdateUserDto {
    @ApiProperty()
    name?: string

    @ApiProperty()
    email?: string

    @ApiProperty()
    password?: string

    @ApiProperty()
    phone?: string

    @ApiProperty()
    birthday?: Date

    @ApiProperty()
    gender?: string

    @ApiProperty({ default: 'member' })
    role?: string = 'member';
}
