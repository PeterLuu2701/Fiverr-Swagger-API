import { ApiProperty, PartialType } from '@nestjs/swagger';

export class UpdateCompletedHireDto {
    @ApiProperty()
    complete: boolean;
}